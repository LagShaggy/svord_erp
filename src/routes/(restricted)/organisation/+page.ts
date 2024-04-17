import type { Alert } from '$src/lib/Alert/alert'
import type { PageLoad } from './$types'

export const load: PageLoad = async (request) => {
	const { supabase } = await request.parent()

	try {
		const { data: profiles, error } = await supabase.from('Profile').select()
		if (error) {
			throw error
		}

		// const {} = await supabase.storage.from('avatars').createSignedUrls(fileList.map(f=>f.), 60)
		return { profiles: profiles ?? [] }
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
