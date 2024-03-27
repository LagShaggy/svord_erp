import type { PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ params: { productId }, locals: { supabase } }) => {
	const { data: product, error } = await supabase
		.from('Product')
		.select()
		.eq('id', productId)
		.limit(1)
		.single()
	if (error) {
		console.log(error)
	}
	return { product }
}
