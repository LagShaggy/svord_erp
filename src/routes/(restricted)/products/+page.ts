import { supabase } from '$lib/supabase/supabaseClient'

export async function load() {
	const { data } = await supabase.from('products').select()
	return {
		products: data ?? []
	}
}
