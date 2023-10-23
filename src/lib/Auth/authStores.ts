import { derived, get, writable, type Writable } from 'svelte/store'
import type { AuthError, AuthTokenResponse, User, Session } from '@supabase/supabase-js'
import { supabase } from '$lib/supabaseClient'

export const AUTH_LOCALSTORAGE_KEY = 'svord_session'

interface SessionStore<T> extends Writable<T> {
	logout: () => Promise<{
		error: AuthError | null
	}>
}

interface SessionObject {
	user: User | null
	session: Session | null
}

const createSession = (): SessionStore<SessionObject> => {
	const store = writable<SessionObject>(undefined)
	const { subscribe, set } = store
	const isBrowser = typeof window !== 'undefined'
	console.log(isBrowser)

	isBrowser &&
		localStorage[AUTH_LOCALSTORAGE_KEY] &&
		set(JSON.parse(localStorage[AUTH_LOCALSTORAGE_KEY]))

	return {
		subscribe,
		set: (n) => {
			isBrowser && (localStorage[AUTH_LOCALSTORAGE_KEY] = JSON.stringify(n))
			set(n)
		},
		update: (cb) => {
			const updatedStore = cb(get(store))

			isBrowser && (localStorage[AUTH_LOCALSTORAGE_KEY] = JSON.stringify(updatedStore))
			set(updatedStore)
		},
		logout: async () => {
			const logoutResponse = await supabase.auth.signOut()
			if (logoutResponse.error) {
				alert(logoutResponse.error)
			} else {
				localStorage.removeItem(AUTH_LOCALSTORAGE_KEY)
				set({
					user: null,
					session: null
				})
				console.log('Logout Successfull')
			}
			return logoutResponse
		}
	}
}

export const session = createSession()

export const user = derived(session, ($session) => $session.user)

export const loggedIn = derived(session, ($session) => $session.user?.aud == 'authenticated')

export const pathPreviouslyOn = writable<string | null>(undefined)
