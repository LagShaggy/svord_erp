import type { Contact, TypedSupabaseClient } from '../schema'

const CONTACT_TABLE = 'contact'

export const getContactById = async (supabase: TypedSupabaseClient, id: number | string) => {
	const { data: account, error } = await supabase
		.from(CONTACT_TABLE)
		.select('*')
		.eq('id', id)
		.single()
	if (error) {
		throw error
	}
	return account
}

export const postContact = async (
	supabase: TypedSupabaseClient,
	newContact: Omit<Contact, 'id'>
) => {
	const { data: contact } = await supabase
		.from(CONTACT_TABLE)
		.insert([newContact])
		.select()
		.throwOnError()

	return contact
}
