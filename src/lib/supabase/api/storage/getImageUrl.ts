import type { TypedSupabaseClient } from '../../schema'
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
		fileName: string | null
		imageSize?: TransformOptions
		duration?: number
	}
): Promise<string> => {
	const { bucket, fileName, imageSize } = options
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

//un-used
export const getImageURL = async (
	supabase: TypedSupabaseClient,
	objectData: {
		bucket: Bucket
		fileName: string | null
		imageSize?: TransformOptions
		duration?: number
	}
): Promise<string> => {
	const { bucket, fileName, imageSize } = objectData
	let { duration } = objectData

	if (!duration) {
		duration = 60
	}
	if (!fileName) {
		return ''
	}
	const { data: imgurl, error } = await supabase.storage
		.from(bucket)
		.createSignedUrl(fileName, duration, { transform: { ...imageSize } })

	if (error) {
		throw error
	}
	return imgurl.signedUrl
}
