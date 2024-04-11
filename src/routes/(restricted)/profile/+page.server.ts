import type { Session } from '@supabase/supabase-js'
import type { Actions } from './$types'
import { fail } from '@sveltejs/kit'

export const actions: Actions = {
	default: async ({ request, locals: { supabase, getSession } }) => {
		const session: Session | null = await getSession()

		const updateProfile = async (
			session: Session | null,
			formData: FormData,
			avatar_url: string | undefined
		) => {
			if (!session) {
				return undefined
			}
			const firstname = formData.get('firstName') as string
			const lastname = formData.get('lastName') as string

			if (firstname || lastname || avatar_url) {
				const { data, error } = await supabase
					.from('Profile')
					.update({
						avatar_url,
						firstname,
						lastname
					})
					.eq('id', session.user.id)
					.select()

				if (error) {
					throw error
				}
				console.log(data)
				return data
			}
		}

		const uploadAvatar = async (session: Session | null, formData: FormData) => {
			if (!session) {
				return undefined
			}
			const avatar = formData.get('file') as File

			const { data: image, error: imageError } = await supabase.storage
				.from('images')
				.upload('/avatars/' + session.user.id, avatar, {
					cacheControl: '3600',
					upsert: true
				})

			if (imageError) {
				throw imageError
			}
			await updateProfile(session, formData, image.path)

			return image.path
		}

		try {
			const formData = await request.formData()
			const imagePath = await uploadAvatar(session, formData)
			await updateProfile(session, formData, imagePath)
		} catch (e) {
			console.log(e)
			fail(401, { e })
		}
	}
}
