import type { ProductImage, TypedSupabaseClient } from '../schema'

const PRODUCT_IMAGE_TABLE = 'product_image'

export const insertProductImage = async (
	supabase: TypedSupabaseClient,
	productImage: Omit<ProductImage, 'id'>
) => {
	const { data, error } = await supabase
		.from(PRODUCT_IMAGE_TABLE)
		.insert([{ ...productImage }])
		.select()
		.single()
	if (error) {
		throw error
	}

	return data
}

export const updateProductImage = async (
	supabase: TypedSupabaseClient,
	productImage: ProductImage
) => {
	const { id, ...productImageUpdate } = productImage

	const { data: updatedProductImage, error } = await supabase
		.from(PRODUCT_IMAGE_TABLE)
		.update({ ...productImageUpdate })
		.eq('id', id)
		.select()

	if (error) {
		throw error
	}
	return updatedProductImage
}
