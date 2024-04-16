import type { Database } from './supabase.types'

export type Profile = Database['public']['Tables']['Profile']['Row']
export type Account = Database['public']['Tables']['Account']['Row']
export type Contact = Database['public']['Tables']['Contact']['Row']

export type Product = Database['public']['Tables']['Product']['Row']
export type ProductCategoryType = Database['public']['Tables']['Product_Category']['Row']

//Enums
export type CurrencyE = Database['public']['Enums']['Currency']
export type CountryE = Database['public']['Enums']['Country']
