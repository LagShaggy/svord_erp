import type { Actions } from './$types'
import { fail } from '@sveltejs/kit'

export const actions: Actions = {
	default: async ({ request, locals: { supabase, getSession } }) => {
		const formData = await request.formData()
		const firstName = formData.get('firstName') as string
		const lastName = formData.get('lastName') as string
		const avatar = formData.get('picture') as string

		const session = await getSession()

		if (session) {
			supabase.from('Profile').update({
				id: session.user.id,
				firstName,
				lastName,
				avatar_url: avatar
			})

			supabase.storage.from('images').upload('uuid', avatar)
		} else {
			fail(401, { message: 'Failed because something' })
		}
	}
}
