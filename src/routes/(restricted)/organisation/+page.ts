import { STORAGE } from '$src/lib/routes'
import type { PageLoad } from './$types'

export const load: PageLoad = async ({ parent }) => {
	const { supabase } = await parent()

	try {
		const { data: profiles, error } = await supabase.from('Profile').select()
		if (error) {
			console.log(error)
			throw error
		}

		const { data: fileList, error: filesError } = await supabase.storage
			.from(STORAGE.IMAGES)
			.list('avatars')

		if (filesError) {
			throw filesError
		}
		console.log(fileList)

		// const {} = await supabase.storage.from('avatars').createSignedUrls(fileList.map(f=>f.), 60)
		return { profiles }
	} catch (e) {
		console.log(e)
	}
}
