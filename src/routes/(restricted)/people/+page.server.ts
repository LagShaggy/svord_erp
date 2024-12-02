import { postAccount } from '$src/lib/supabase/api/account'
import type { Account, Contact } from '$src/lib/supabase/schema'
import { fail } from '@sveltejs/kit'
import type { Actions, PageServerLoad } from './$types'
import type { Alert } from '$src/lib/UI/Alert/alert'
import { postContact } from '$src/lib/supabase/api/contact'
import { stringify } from 'openai/internal/qs/stringify.mjs'

export const load: PageServerLoad = async ({ locals: { supabase } }) => {
	const { data: accounts, error } = await supabase
		.from('account')
		.select('id, name, country(*), description, email, website')
	if (error) {
		console.log(error)
	}
	const { data: contacts, error: contactError } = await supabase
		.from('contact')
		.select('*')
	if (contactError) {
		console.log(contactError)
	}
	return { accounts, contacts }
}

export const actions: Actions = {
	createAccount: async ({ request, locals: { supabase } }) => {
		const data = await request.formData()
		const account = Object.fromEntries(data) as unknown as Account & { country: number }
		try {
			await postAccount(supabase, { ...account, country: account.country })
		} catch (e) {
			console.log(e)
			const alert: Alert = {
				type: 'ERROR',
				message: `Something went wrong while creating a new account`,
				title: 'Creation Error'
			}
			return fail(400, { e, alert })
		}
	},
	createContact: async ({ request, locals: { supabase } }) => {
		const data = await request.formData()
		const contact = Object.fromEntries(data) as unknown as Omit<Contact, 'id'>
		try {
			await postContact(supabase, contact)
		} catch (e) {
			console.log(e)
			const alert: Alert = {
				type: 'ERROR',
				message: 'Contact creation has failed',
				title: 'Contact Creation Error'
			}
			return fail(400, { alert })
		}
	}
}
