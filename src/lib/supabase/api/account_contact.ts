import type { Account, TypedSupabaseClient } from '../schema'

const ACCOUNT_CONTACT_TABLE = 'account_contact'

export const getAccountContactByAccountId = async (
	supabase: TypedSupabaseClient,
	accountId: number | string
) => {
	const { data: accountContacts, error } = await supabase
		.from(ACCOUNT_CONTACT_TABLE)
		.select('id, account_id, contact(*), relationship, untill, since')
		.eq('account_id', accountId)

	if (error) {
		throw error
	}
	return accountContacts
}
