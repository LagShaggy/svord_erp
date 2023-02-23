import { supabase } from '$lib/supabaseClient';

export const prerender = true;

export async function load() {
	const { data } = await supabase.from('users').select();
	return {
		users: data ?? []
	};
}
