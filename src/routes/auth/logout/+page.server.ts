import type { Actions } from './$types'

export const actions: Actions = {
	logout: async ({ locals: { supabase } }) => {
		console.log('Logout Action')
		supabase.auth.signOut()
	}
}
