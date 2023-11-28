import type { PageServerLoad } from '../$types'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const products = await supabase.from('Product').select()
	return { products }
}
