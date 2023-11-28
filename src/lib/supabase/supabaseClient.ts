import type { SupabaseClient } from '@supabase/supabase-js'

export let supabase: SupabaseClient

export const setSupabaseClient = (cl: SupabaseClient) => {
	supabase = cl
}
