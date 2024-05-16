import { Country } from '$src/lib/Icons/Flags/countries.enum'
import { postAccount } from '$src/lib/supabase/api/account'
import type { Account } from '$src/lib/supabase/schema'
import { fail } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'
import type { Alert } from '$src/lib/Alert/alert'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data: accounts, error } = await supabase.from('Account').select()
	if (error) {
		console.log(error)
	}
	return { accounts }
}

export const actions: Actions = {
	createAccount: async ({ request, locals: { supabase } }) => {
		const data = await request.formData()
		const account = Object.fromEntries(data) as unknown as Account
		try {
			postAccount(supabase, { ...account, country: Country.Anguilla })
		} catch (e) {
			console.log(e)
			const alert: Alert = {
				type: 'ERROR',
				message: `Something went wrong while creating a new account ${e.message}`,
				title: 'Creation Error'
			}
			fail(400, { e, alert })
		}
	},
	createContact: async ({ request }) => {
		console.log(request.formData())
	}
}
