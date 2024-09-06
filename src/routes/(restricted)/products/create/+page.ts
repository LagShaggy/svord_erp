import type { PageLoad } from './$types'

export const load: PageLoad = async ({ parent }) => {
	const { supabase } = await parent()
	const { data, error } = await supabase.from('product_category').select()
	if (error) {
		console.log(error.message)
	}
	return { categories: data }
}
