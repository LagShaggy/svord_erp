import { PUBLIC_SUPABASE_ANON_KEY, PUBLIC_SUPABASE_URL } from '$env/static/public'
import type { Database } from '$src/lib/supabase/supabase'
import type { LayoutLoad } from './$types'
import { createBrowserClient, isBrowser, parse } from '@supabase/ssr'

export const load: LayoutLoad = async ({ fetch, data, depends }) => {
	depends('supabase:auth')

	const supabase = createBrowserClient<Database>(PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY, {
		global: {
			fetch
		},
		cookies: {
			get(key) {
				if (!isBrowser()) {
					return JSON.stringify(data.session)
				}

				const cookie = parse(document.cookie)
				return cookie[key]
			}
		}
	})

	const {
		data: { session }
	} = await supabase.auth.getSession()
	const { data: profile, error } = await supabase.from('Profile').select().single()

	if (error) {
		console.log(error)
	}

	//TODO: rework this abom
	let profilePicture
	if (profile?.avatar_url) {
		const { data: picUrl, error } = await supabase.storage
			.from('images')
			.createSignedUrl(profile.avatar_url, 60)

		if (error) {
			console.log(profile?.avatar_url)
			console.log(error)
		}

		profilePicture = picUrl?.signedUrl
	}

	return { supabase, session, profile, profilePicture }
}
