import { supabase } from './supabaseClient'
export const api = {
	getUserData: async () => await supabase.auth.getUser()
}
