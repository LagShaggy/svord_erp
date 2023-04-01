import { supabase } from '$lib/supabaseClient'

export async function signOut() {
	const { error } = await supabase.auth.signOut()

	if (error) {
		alert(error)
	}
}
