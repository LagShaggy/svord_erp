import type { Alert } from '$src/lib/UI/Alert/alert'
import type { Actions } from './$types'

export const actions: Actions = {
	logout: async ({ locals: { supabase } }) => {
		console.log('Logout Action')
		await supabase.auth.signOut()

		const alert: Alert = { message: 'Successfully logged out.', title: 'Logout', type: 'OK' }
		return { alert }
	}
}
