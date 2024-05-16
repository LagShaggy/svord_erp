import type { SupabaseClient } from '@supabase/supabase-js'
import type { Database } from './supabase.types'

export type TypedSupabaseClient = SupabaseClient<Database>

export type Profile = Database['public']['Tables']['Profile']['Row']
export type Account = Database['public']['Tables']['Account']['Row']
export type Contact = Database['public']['Tables']['Contact']['Row']

export type Country = Database['public']['Tables']['country']['Row']

export type Product = Database['public']['Tables']['Product']['Row']
export type ProductCategoryType = Database['public']['Tables']['Product_Category']['Row']
export type ProductImage = Database['public']['Tables']['product_image']['Row']

//Enums
export type CurrencyE = Database['public']['Enums']['Currency']
export type CountryE = Database['public']['Enums']['Country']
