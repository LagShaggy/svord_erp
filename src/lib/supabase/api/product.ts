import type { TypedSupabaseClient } from '../schema'

const PRODUCT_TABLE = 'Product'

export const getProductById = async (supabase: TypedSupabaseClient, id: number | string) => {
	const { data: product, error } = await supabase
		.from(PRODUCT_TABLE)
		.select(
			`
			id,
			name,
			description,
			category(*),
            product_image(*)
		`
		)
		.eq('id', id)
		.single()
		.throwOnError()
	if (error) {
		throw error
	}
	return product
}
