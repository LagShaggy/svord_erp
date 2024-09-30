import type { Account, TypedSupabaseClient } from '../schema'

const ACCOUNT_TABLE = 'account'

export const getAccountById = async (supabase: TypedSupabaseClient, id: number | string) => {
	const { data: account, error } = await supabase
		.from(ACCOUNT_TABLE)
		.select('id, name, description, email, website, country(name, iso)')
		.eq('id', id)
		.single()
	if (error) {
		throw error
	}
	return account
}

export const postAccount = async (
	supabase: TypedSupabaseClient,
	newAccount: Omit<Account, 'id'>
) => {
	const { data: account } = await supabase
		.from(ACCOUNT_TABLE)
		.insert([newAccount])
		.select()
		.throwOnError()

	return account
}
