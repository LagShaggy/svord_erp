import { getProductById } from '$src/lib/supabase/api/product'
import { browserSupabase } from '$src/lib/supabase/supabaseClient'
import type { PageLoad } from './$types'

// export const load: PageLoad = async ({ params: { productId }, parent }) => {
// 	const { supabase } = await parent()
// 	const { data: product, error } = await supabase
// 		.from('Product')
// 		.select(
// 			`
// 			id,
// 			name,
// 			abbreviation,
// 			description,
// 			category(*)
// 		`
// 		)
// 		.eq('id', productId)
// 		.single()
// 	if (error) {
// 		console.log(error)
// 	}

// 	console.log(product)

// 	const { data: alternativeProducts, error: categoryError } = await supabase
// 		.from('Product')
// 		.select()
// 		.eq('category', product?.category.id)

// 	const { data: components, error: componentsError } = await supabase
// 		.from('product_component')
// 		.select(
// 			`
// 			component(*)
// 		`
// 		)
// 		.eq('main', product.id)
// 	console.log(components)

// return { product, alternativeProducts, components }

export const load: PageLoad = async ({ params: { productId } }) => {
	try {
		const product = await getProductById(browserSupabase, productId)

		const { data: alternativeProducts, error: categoryError } = await browserSupabase
			.from('Product')
			.select()
			.eq('category', product?.category.id)

		const { data: components, error: componentsError } = await browserSupabase
			.from('product_component')
			.select(
				`
			component(*)
		`
			)
			.eq('main', product.id)
		return { product, components, alternativeProducts }
	} catch (e) {
		console.log(e)
	}
}
