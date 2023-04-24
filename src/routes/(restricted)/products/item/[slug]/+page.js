import { supabase } from '$lib/supabaseClient'

export async function load({ params }) {
	const { data } = await supabase
		.from('products')
		.select()
		.eq('id', params.slug)
	return {
		item: data[0] ?? []
	}
}
