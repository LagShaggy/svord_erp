import { getAccountById } from '$src/lib/supabase/api/account'
import { getAccountContactByAccountId } from '$src/lib/supabase/api/account_contact'
import { browserSupabase } from '$src/lib/supabase/supabaseClient'
import type { PageLoad } from './$types'

export const load: PageLoad = async ({ params: { accountId } }) => {
	try {
		console.log(accountId)
		const account = await getAccountById(browserSupabase, accountId)
		const accountContacts = await getAccountContactByAccountId(browserSupabase, accountId)
		console.log(account)
		console.log(accountContacts)
		return { accountContacts, account }
	} catch (error) {
		console.log(error)
	}
}
