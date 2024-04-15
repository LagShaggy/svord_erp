import { PUBLIC_SUPABASE_ANON_KEY, PUBLIC_SUPABASE_URL } from '$env/static/public'
import type { Database } from '$src/lib/supabase/supabase.types'
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

	const getSession = async () => {
		let session
		try {
			const {
				data: { session: sessionData },
				error: sessionError
			} = await supabase.auth.getSession()

			if (sessionError) {
				throw sessionError
			}
			session = sessionData
		} catch (e) {
			console.log(e)
		}
		return session ?? undefined
	}

	const session = await getSession()

	return { supabase, session }
}
