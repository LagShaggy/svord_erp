import type { LayoutLoad } from './$types'
import { redirect } from '@sveltejs/kit'
import { api } from '$lib/supabase/supabase.api'
import { browser } from '$app/environment'

export const load: LayoutLoad = async () => {
	if (browser) {
		const { data } = await api.getUserData()
		if (!data.user) {
			throw redirect(307, '/auth/login')
		}
	}
}
