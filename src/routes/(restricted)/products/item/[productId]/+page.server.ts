import { getProductById } from '$src/lib/supabase/api/product'
import { insertProductImage } from '$src/lib/supabase/api/productImage'
import { Bucket, uploadToBucket, type SvordFile } from '$src/lib/supabase/api/storage/uploader'
import type { ProductImage } from '$src/lib/supabase/schema'
import type { Actions } from '@sveltejs/kit'

export const actions: Actions = {
	uploadImage: async ({ request, locals: { supabase }, params }) => {
		const formData = Object.fromEntries(await request.formData())
		const { file } = formData as unknown as SvordFile<ProductImage>

		try {
			const product = await getProductById(supabase, params.productId as string)
			const filePath = await uploadToBucket(supabase, {
				bucket: Bucket.ProductImages,
				file,
				upsert: false,
				folderPrefix: product.id
			})

			const productImage = await insertProductImage(supabase, {
				coverImage: false,
				productId: product.id,
				filePath
			})

			return { productImage }
		} catch (e) {
			console.log(e)
		}
	},

	uploadCoverImage: async ({ params, request, locals: { supabase } }) => {
		const formData = Object.fromEntries(await request.formData())
		const { file } = formData as unknown as SvordFile<ProductImage>
		try {
			const product = await getProductById(supabase, params.productId as string)

			const filePath = await uploadToBucket(supabase, {
				bucket: Bucket.ProductImages,
				file,
				upsert: false,
				folderPrefix: product.id
			})

			const productImage = await insertProductImage(supabase, {
				coverImage: true,
				productId: product.id,
				filePath
			})

			return { productImage }
		} catch (e) {
			return invalid()
		}
	}
}
