import { TABLES } from '$src/lib/routes'
import type { PageLoad } from './$types'

export const load: PageLoad = async ({ params: { productId }, parent }) => {
	const { supabase } = await parent()
	const { data: product, error } = await supabase
		.from(TABLES.PRODUCT)
		.select(
			`
			id,
			name,
			description,
			category(id, name, colour_hex)
			product_variant(id, product_id, name)
		`
		)
		.eq('id', productId)
		.single()
	if (error) {
		console.log(error)
	}
	return { product }
}
