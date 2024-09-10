import { postAccount } from '$src/lib/supabase/api/account'
import type { Account } from '$src/lib/supabase/schema'
import { fail } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'
import type { Alert } from '$src/lib/UI/Alert/alert'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data: accounts, error } = await supabase
		.from('account')
		.select('id, name, country(*), description, email, website')
	if (error) {
		console.log(error)
	}
	return { accounts }
}

export const actions: Actions = {
	createAccount: async ({ request, locals: { supabase } }) => {
		const data = await request.formData()
		const account = Object.fromEntries(data) as unknown as Account & { country: number }
		try {
			postAccount(supabase, { ...account, country: account.country })
		} catch (e) {
			console.log(e)
			const alert: Alert = {
				type: 'ERROR',
				message: `Something went wrong while creating a new account`,
				title: 'Creation Error'
			}
			fail(400, { e, alert })
		}
	},
	createContact: async ({ request }) => {
		console.log(request.formData())
	}
}
