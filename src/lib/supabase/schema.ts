import type { SupabaseClient } from '@supabase/supabase-js'
import type { Database } from './database.types'

export type TypedSupabaseClient = SupabaseClient<Database>

export type Profile = Database['public']['Tables']['profile']['Row']
export type Account = Database['public']['Tables']['account']['Row']
export type Contact = Database['public']['Tables']['contact']['Row']

export type Country = Database['public']['Tables']['country']['Row']

export type Product = Database['public']['Tables']['product']['Row']
export type ProductCategoryType = Database['public']['Tables']['product_category']['Row']
export type ProductImage = Database['public']['Tables']['product_image']['Row']
