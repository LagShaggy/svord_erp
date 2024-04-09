import { PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY } from '$env/static/public'
import { onAuthPage } from '$lib/Auth/auth.helpers'
import { ROUTES } from '$lib/routes'
import { createServerClient } from '@supabase/ssr'
import { redirect, type Handle } from '@sveltejs/kit'
import type { Database } from './lib/supabase/supabase'

export const handle: Handle = async ({ event, resolve }) => {
	const supabase = createServerClient<Database>(PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY, {
		cookies: {
			get: (key) => event.cookies.get(key),
			/**
			 * Note: You have to add the `path` variable to the
			 * set and remove method due to sveltekit's cookie API
			 * requiring this to be set, setting the path to an empty string
			 * will replicate previous/standard behaviour (https://kit.svelte.dev/docs/types#public-types-cookies)
			 */
			set: (key, value, options) => {
				event.cookies.set(key, value, { ...options, path: '/' })
			},
			remove: (key, options) => {
				event.cookies.delete(key, { ...options, path: '/' })
			}
		}
	})

	event.locals.supabase = supabase

	/**
	 * a little helper that is written for convenience so that instead
	 * of calling `const { data: { session } } = await supabase.auth.getSession()`
	 * you just call this `await getSession()`
	 */
	event.locals.getSession = async () => {
		const {
			data: { session }
		} = await supabase.auth.getSession()
		return session
	}

	const session = await event.locals.getSession()

	// Protecting routes && authentication
	if (!session && !onAuthPage(event.route.id)) {
		console.log('not authenticated. redirecting to login')
		redirect(303, ROUTES.AUTH.LOGIN)
	}

	// if authenticated and on auth route, redirect.
	if (session && onAuthPage(event.route.id)) {
		console.log('session found, redirecting to app.')
		redirect(301, ROUTES.HOME)
	}

	return resolve(event, {
		filterSerializedResponseHeaders(name) {
			return name === 'content-range'
		}
	})
}
