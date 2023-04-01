import { supabase } from '$lib/supabaseClient'
import { page } from '$app/stores'

console.log(page)

export async function load({ params }) {
	const { data } = await supabase
		.from('products')
		.select()
		.eq('id', params.slug)
	return {
		item: data[0] ?? []
	}
}
