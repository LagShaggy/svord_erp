// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces
import type { SupabaseClient, Session } from '@supabase/supabase-js'

declare global {
	namespace App {
		// interface Error {}
		interface Locals {
			supabase: SupabaseClient
			getSession(): Promise<Session | null>
			// prisma: PrismaClient
		}
		// interface PageData {
		// 	session: Session | null
		// }
		// interface Platform {}
	}
}

export {}
