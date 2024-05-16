import type { PageLoad } from './$types'

export const load: PageLoad = async ({ params: { productId }, parent }) => {
	const { supabase } = await parent()
	const { data: product, error } = await supabase
		.from('Product')
		.select(
			`
			id,
			name,
			abbreviation,
			description,
			category(*)
		`
		)
		.eq('id', productId)
		.single()
	if (error) {
		console.log(error)
	}

	console.log(product)

	const { data: alternativeProducts, error: categoryError } = await supabase
		.from('Product')
		.select()
		.eq('category', product?.category.id)

	const { data: components, error: componentsError } = await supabase
		.from('product_component')
		.select(
			`
			component(*)
		`
		)
		.eq('main', product.id)
	console.log(components)

	return { product, alternativeProducts, components }
}
