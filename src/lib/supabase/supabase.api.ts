import { browserSupabase } from './supabaseClient'
export const api = {
	getUserData: async () => await browserSupabase.auth.getUser()
}
