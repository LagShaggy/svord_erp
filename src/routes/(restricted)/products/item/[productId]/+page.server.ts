import { TABLES } from '$src/lib/routes'
import type { PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ params: { productId }, locals: { supabase } }) => {
	const { data: product, error } = await supabase
		.from(TABLES.PRODUCTS)
		.select()
		.eq('id', productId)
		.single()
	if (error) {
		console.log(error)
	}
	return { product }
}
