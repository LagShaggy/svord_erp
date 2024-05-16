export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: {
      Account: {
        Row: {
          accepted_currencies: Database["public"]["Enums"]["Currency"][] | null
          country: number
          description: string | null
          email: string
          id: number
          name: string
          website: string | null
        }
        Insert: {
          accepted_currencies?: Database["public"]["Enums"]["Currency"][] | null
          country?: number
          description?: string | null
          email: string
          id?: number
          name: string
          website?: string | null
        }
        Update: {
          accepted_currencies?: Database["public"]["Enums"]["Currency"][] | null
          country?: number
          description?: string | null
          email?: string
          id?: number
          name?: string
          website?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "public_Account_country_fkey"
            columns: ["country"]
            isOneToOne: false
            referencedRelation: "country"
            referencedColumns: ["id"]
          },
        ]
      }
      account_contact: {
        Row: {
          account_id: number
          contact_id: number
          id: number
          relationship: number
          since: string
          untill: string | null
        }
        Insert: {
          account_id: number
          contact_id: number
          id?: number
          relationship: number
          since?: string
          untill?: string | null
        }
        Update: {
          account_id?: number
          contact_id?: number
          id?: number
          relationship?: number
          since?: string
          untill?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "public_account_contact_account_id_fkey"
            columns: ["account_id"]
            isOneToOne: false
            referencedRelation: "Account"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_account_contact_contact_id_fkey"
            columns: ["contact_id"]
            isOneToOne: false
            referencedRelation: "Contact"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_account_contact_relationship_fkey"
            columns: ["relationship"]
            isOneToOne: false
            referencedRelation: "relationship"
            referencedColumns: ["id"]
          },
        ]
      }
      Contact: {
        Row: {
          email: string
          firstName: string | null
          id: number
          lastname: string
          personality: string | null
        }
        Insert: {
          email: string
          firstName?: string | null
          id?: number
          lastname: string
          personality?: string | null
        }
        Update: {
          email?: string
          firstName?: string | null
          id?: number
          lastname?: string
          personality?: string | null
        }
        Relationships: []
      }
      country: {
        Row: {
          id: number
          iso: string
          iso3: string | null
          name: string
          nicename: string
          numcode: number | null
          phonecode: number | null
        }
        Insert: {
          id?: number
          iso: string
          iso3?: string | null
          name: string
          nicename: string
          numcode?: number | null
          phonecode?: number | null
        }
        Update: {
          id?: number
          iso?: string
          iso3?: string | null
          name?: string
          nicename?: string
          numcode?: number | null
          phonecode?: number | null
        }
        Relationships: []
      }
      currency: {
        Row: {
          id: number
          iso: string
          name: string
          symbol: string
        }
        Insert: {
          id?: number
          iso?: string
          name?: string
          symbol?: string
        }
        Update: {
          id?: number
          iso?: string
          name?: string
          symbol?: string
        }
        Relationships: []
      }
      Post: {
        Row: {
          accountId: number | null
          id: number
          message: string
        }
        Insert: {
          accountId?: number | null
          id?: number
          message: string
        }
        Update: {
          accountId?: number | null
          id?: number
          message?: string
        }
        Relationships: [
          {
            foreignKeyName: "Post_accountId_fkey"
            columns: ["accountId"]
            isOneToOne: false
            referencedRelation: "Account"
            referencedColumns: ["id"]
          },
        ]
      }
      price: {
        Row: {
          currency: Database["public"]["Enums"]["Currency"]
          id: number
          price: number
        }
        Insert: {
          currency?: Database["public"]["Enums"]["Currency"]
          id?: number
          price: number
        }
        Update: {
          currency?: Database["public"]["Enums"]["Currency"]
          id?: number
          price?: number
        }
        Relationships: []
      }
      Product: {
        Row: {
          category: number | null
          description: string | null
          id: number
          name: string
        }
        Insert: {
          category?: number | null
          description?: string | null
          id?: number
          name: string
        }
        Update: {
          category?: number | null
          description?: string | null
          id?: number
          name?: string
        }
        Relationships: [
          {
            foreignKeyName: "public_Product_category_fkey"
            columns: ["category"]
            isOneToOne: false
            referencedRelation: "Product_Category"
            referencedColumns: ["id"]
          },
        ]
      }
      Product_Category: {
        Row: {
          abbr: string | null
          colour_hex: string | null
          id: number
          name: string
        }
        Insert: {
          abbr?: string | null
          colour_hex?: string | null
          id?: number
          name: string
        }
        Update: {
          abbr?: string | null
          colour_hex?: string | null
          id?: number
          name?: string
        }
        Relationships: []
      }
      product_image: {
        Row: {
          coverImage: boolean
          filePath: string
          id: number
          productId: number
        }
        Insert: {
          coverImage?: boolean
          filePath: string
          id?: number
          productId: number
        }
        Update: {
          coverImage?: boolean
          filePath?: string
          id?: number
          productId?: number
        }
        Relationships: [
          {
            foreignKeyName: "public_product_image_productId_fkey"
            columns: ["productId"]
            isOneToOne: false
            referencedRelation: "Product"
            referencedColumns: ["id"]
          },
        ]
      }
      product_variant: {
        Row: {
          description: string | null
          dimension: number | null
          id: number
          material: number | null
          name: string
          product_id: number
          weight: number | null
        }
        Insert: {
          description?: string | null
          dimension?: number | null
          id?: number
          material?: number | null
          name: string
          product_id: number
          weight?: number | null
        }
        Update: {
          description?: string | null
          dimension?: number | null
          id?: number
          material?: number | null
          name?: string
          product_id?: number
          weight?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "public_product_variant_product_id_fkey"
            columns: ["product_id"]
            isOneToOne: false
            referencedRelation: "Product"
            referencedColumns: ["id"]
          },
        ]
      }
      product_variant_manufacturer: {
        Row: {
          currency: Database["public"]["Enums"]["Currency"]
          manufacturer_id: number
          price: number
          product_variant_id: number
        }
        Insert: {
          currency?: Database["public"]["Enums"]["Currency"]
          manufacturer_id: number
          price?: number
          product_variant_id?: number
        }
        Update: {
          currency?: Database["public"]["Enums"]["Currency"]
          manufacturer_id?: number
          price?: number
          product_variant_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "public_product_variant_manufacturer_manufacturer_id_fkey"
            columns: ["manufacturer_id"]
            isOneToOne: false
            referencedRelation: "Account"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_product_variant_manufacturer_product_variant_id_fkey"
            columns: ["product_variant_id"]
            isOneToOne: false
            referencedRelation: "product_variant"
            referencedColumns: ["id"]
          },
        ]
      }
      Profile: {
        Row: {
          avatar_url: string | null
          firstname: string | null
          id: string
          lastname: string | null
        }
        Insert: {
          avatar_url?: string | null
          firstname?: string | null
          id: string
          lastname?: string | null
        }
        Update: {
          avatar_url?: string | null
          firstname?: string | null
          id?: string
          lastname?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "public_Profile_id_fkey"
            columns: ["id"]
            isOneToOne: true
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
        ]
      }
      relationship: {
        Row: {
          description: string
          id: number
          name: string
        }
        Insert: {
          description: string
          id?: number
          name: string
        }
        Update: {
          description?: string
          id?: number
          name?: string
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
      Country: "CH" | "CN" | "DE" | "US" | "GB"
      Currency: "USD" | "RMB" | "Euro" | "CHF" | "GBP"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type PublicSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
      Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] &
        PublicSchema["Views"])[PublicTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
  ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never

