import type { Actions } from './$types'
import { fail } from '@sveltejs/kit'

export const actions: Actions = {
	default: async ({ request, locals: { supabase, getSession } }) => {
		const formData = await request.formData()
		const firstname = formData.get('firstName') as string
		const lastname = formData.get('lastName') as string
		const avatar = formData.get('file') as File

		console.log(formData)

		const session = await getSession()

		if (session) {
			if (avatar) {
				const { data: image, error: imageError } = await supabase.storage
					.from('images')
					.upload('/avatars/' + session.user.id, avatar, {
						cacheControl: '3600',
						upsert: true
					})

				if (imageError) {
					console.log("uploading image didn't work")
					console.log(imageError)
				}

				const { data, error } = await supabase
					.from('Profile')
					.update({
						avatar_url: image?.path
					})
					.eq('id', session.user.id)
					.select()
			}

			if (firstname || lastname) {
				console.log('updating name')

				const { data, error } = await supabase
					.from('Profile')
					.update({
						firstname,
						lastname
					})
					.eq('id', session.user.id)
					.select()

				if (error) {
					console.log(error)
					fail(401, { message: 'Failed because something' })
				}
				console.log(data)
			}
		} else {
			fail(401, { message: 'Failed No Session found' })
		}
	}
}
