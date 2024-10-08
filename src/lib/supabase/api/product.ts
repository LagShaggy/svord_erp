import type { Product, TypedSupabaseClient } from '../schema'

const PRODUCT_TABLE = 'product'

export const getProductById = async (supabase: TypedSupabaseClient, productId: number | string) => {
	const { data: product, error } = await supabase
		.from(PRODUCT_TABLE)
		.select(
			`
			id,
			name,
			abbreviation,
			description,
			category,
            product_image(*)
		`
		)
		.eq('id', productId)
		.single()
	
		if(error){
			throw error
		}

	return product
}

export const getAlternativeProducts = async (
	supabase: TypedSupabaseClient,
	categoryId: number | null
) => {
	if (!categoryId) {
		return []
	}
	const { data: alternativeProducts, error } = await supabase
		.from('product')
		.select()
		.eq('category', categoryId)
	if (error) {
		throw error
	}
	return alternativeProducts
}

export const getComponents = async (supabase: TypedSupabaseClient, productId: number | null) => {
	if (!productId) {
		return []
	}
	const { data: components, error } = await supabase
		.from('product_component')
		.select('product_component(*)')
		.eq('main', productId)
		.single();

	if(error){
		throw error
	}
	return components?.product_component
}
