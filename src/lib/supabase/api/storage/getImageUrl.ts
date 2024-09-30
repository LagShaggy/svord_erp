import type { ProductImage, TypedSupabaseClient } from '../../schema'
import type { Database } from '../../database.types'
import type { Bucket } from './uploader'

export type TransformOptions = {
	width: number
	height: number
	resize?: 'contain' | 'cover' | 'fill'
}

export const getImage = async (
	supabase: TypedSupabaseClient,
	options: {
		bucket: Bucket
		filePath: string | undefined
		imageSize?: TransformOptions
		duration?: number
	}
): Promise<string> => {
	const { bucket, filePath: fileName, imageSize } = options
	let { duration } = options
	if (!fileName) {
		return ''
	}
	if (!duration) {
		duration = 60
	}

	const { data: imgurl, error } = await supabase.storage
		.from(bucket)
		.createSignedUrl(fileName, duration, { transform: { ...imageSize } })

	if (error) {
		throw error
	}
	return imgurl.signedUrl
}

export const deleteProductImage = async (
	supabase: TypedSupabaseClient,
	options: {
		bucket: Bucket
		productImage: (Partial<ProductImage> & { id: number }) | undefined
	}
) => {
	const { bucket, productImage } = options
	if (!productImage?.filePath) {
		return
	}
	await supabase.storage.from(bucket).remove([productImage.filePath])

	const { error } = await supabase.from('product_image').delete().eq('id', productImage?.id)

	if (error) {
		throw error
	}
}

export const downloadImage = async (
	supabase: TypedSupabaseClient,
	options: {
		bucket: Bucket
		productImage: ProductImage | undefined
	}
) => {
	const { bucket, productImage } = options
	if (!productImage?.filePath) throw 'no filepath found'
	const { data: file, error } = await supabase.storage.from(bucket).download(productImage.filePath)
	if (error) {
		throw error
	}
	return file
}

//currently not working idk why.
export const getImageData = async (
	supabase: TypedSupabaseClient,
	options: {
		bucket: Bucket
		filePath: string | undefined
	}
) => {
	const { bucket, filePath } = options
	if (!filePath) return undefined
	const { data, error } = await supabase.storage.from(bucket).info(filePath)
}
