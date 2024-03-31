import type { PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data: products, error } = await supabase.from('Product').select()
	if (error) {
		console.log(error)
	}
	return { products }
}
