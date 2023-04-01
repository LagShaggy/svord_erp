import { supabase } from '$lib/supabaseClient'

const { data, error } = await supabase.auth.signUp({
	email: 'example@email.com',
	password: 'example-password'
})
