export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      order_products: {
        Row: {
          order_id: number
          product_id: number | null
          quantity: number | null
        }
        Insert: {
          order_id?: number
          product_id?: number | null
          quantity?: number | null
        }
        Update: {
          order_id?: number
          product_id?: number | null
          quantity?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "order_products_order_id_fkey"
            columns: ["order_id"]
            referencedRelation: "orders"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "order_products_product_id_fkey"
            columns: ["product_id"]
            referencedRelation: "products"
            referencedColumns: ["id"]
          }
        ]
      }
      orders: {
        Row: {
          client_email: string | null
          client_name: string | null
          created_at: string | null
          id: number
        }
        Insert: {
          client_email?: string | null
          client_name?: string | null
          created_at?: string | null
          id?: number
        }
        Update: {
          client_email?: string | null
          client_name?: string | null
          created_at?: string | null
          id?: number
        }
        Relationships: []
      }
      product_variants: {
        Row: {
          description: string | null
          id: number
          "product.id": number
          properties: Json | null
        }
        Insert: {
          description?: string | null
          id?: number
          "product.id": number
          properties?: Json | null
        }
        Update: {
          description?: string | null
          id?: number
          "product.id"?: number
          properties?: Json | null
        }
        Relationships: [
          {
            foreignKeyName: "product_variants_product.id_fkey"
            columns: ["product.id"]
            referencedRelation: "products"
            referencedColumns: ["id"]
          }
        ]
      }
      products: {
        Row: {
          description: Json | null
          id: number
          name: string | null
          quantity: number
        }
        Insert: {
          description?: Json | null
          id?: number
          name?: string | null
          quantity?: number
        }
        Update: {
          description?: Json | null
          id?: number
          name?: string | null
          quantity?: number
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      variant_type: "Colour" | "Size" | "Thickness"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}
