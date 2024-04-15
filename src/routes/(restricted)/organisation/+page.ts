import type { Alert } from '$src/lib/Alert/alert'
import { STORAGE } from '$src/lib/routes'
import type { PageLoad } from './$types'

export const load: PageLoad = async ({ parent }) => {
	const { supabase } = await parent()

	try {
		const { data: profiles, error } = await supabase.from('Profile').select()
		if (error) {
			throw error
		}

		const { data: fileList, error: filesError } = await supabase.storage
			.from(STORAGE.IMAGES)
			.list('avatars')

		if (filesError) {
			throw filesError
		}

		// const {} = await supabase.storage.from('avatars').createSignedUrls(fileList.map(f=>f.), 60)
		return { profiles, fileList }
	} catch (e) {
		console.log(e)
		const alert: Alert = {
			title: 'Error Occured',
			message: e.message,
			type: 'ERROR'
		}
		return { alert }
	}
}
