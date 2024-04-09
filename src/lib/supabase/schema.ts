import type { Database } from './supabase'

export type Profile = Database['public']['Tables']['Profile']['Row']
export type Account = Database['public']['Tables']['Account']['Row']
export type Product = Database['public']['Tables']['Product']['Row']
export type ProductCategory = Database['public']['Tables']['Product_Category']['Row']
