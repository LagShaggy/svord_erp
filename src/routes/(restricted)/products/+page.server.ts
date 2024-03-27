import type { PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data: products, error } = await supabase.from('Product').select().range(0, 9)
	if (error) {
		console.log(error)
	}
	return { products }
}
