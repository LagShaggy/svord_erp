// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces
import type { Session, SupabaseClient, User } from '@supabase/supabase-js'
import type { Database } from './lib/supabase/supabase.types'

declare global {
	namespace App {
		// interface Error {}
		interface Locals {
			supabase: SupabaseClient<Database>
			user: User | null
			getSession(): Promise<Session | null>
		}
	}
}

export {}
