export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          operationName?: string
          query?: string
          variables?: Json
          extensions?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      account: {
        Row: {
          country: number
          description: string | null
          email: string
          id: number
          name: string
          website: string | null
        }
        Insert: {
          country?: number
          description?: string | null
          email: string
          id?: number
          name: string
          website?: string | null
        }
        Update: {
          country?: number
          description?: string | null
          email?: string
          id?: number
          name?: string
          website?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "public_account_country_fkey"
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
          until: string | null
        }
        Insert: {
          account_id: number
          contact_id: number
          id?: number
          relationship: number
          since?: string
          until?: string | null
        }
        Update: {
          account_id?: number
          contact_id?: number
          id?: number
          relationship?: number
          since?: string
          until?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "public_account_contact_account_id_fkey"
            columns: ["account_id"]
            isOneToOne: false
            referencedRelation: "account"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_account_contact_contact_id_fkey"
            columns: ["contact_id"]
            isOneToOne: false
            referencedRelation: "contact"
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
      contact: {
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
      lead: {
        Row: {
          contact: number
          id: number
        }
        Insert: {
          contact: number
          id?: number
        }
        Update: {
          contact?: number
          id?: number
        }
        Relationships: [
          {
            foreignKeyName: "public_lead_contact_fkey"
            columns: ["contact"]
            isOneToOne: false
            referencedRelation: "contact"
            referencedColumns: ["id"]
          },
        ]
      }
      opportunity: {
        Row: {
          buyer: number
          contact: number
          id: number
        }
        Insert: {
          buyer: number
          contact: number
          id?: number
        }
        Update: {
          buyer?: number
          contact?: number
          id?: number
        }
        Relationships: [
          {
            foreignKeyName: "public_opportunity_buyer_fkey"
            columns: ["buyer"]
            isOneToOne: false
            referencedRelation: "account"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_opportunity_contact_fkey"
            columns: ["contact"]
            isOneToOne: false
            referencedRelation: "contact"
            referencedColumns: ["id"]
          },
        ]
      }
      post: {
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
            foreignKeyName: "post_accountId_fkey"
            columns: ["accountId"]
            isOneToOne: false
            referencedRelation: "account"
            referencedColumns: ["id"]
          },
        ]
      }
      price: {
        Row: {
          id: number
          price: number
        }
        Insert: {
          id?: number
          price: number
        }
        Update: {
          id?: number
          price?: number
        }
        Relationships: []
      }
      product: {
        Row: {
          abbreviation: string
          active: boolean
          category: number | null
          description: string | null
          id: number
          name: string
        }
        Insert: {
          abbreviation?: string
          active?: boolean
          category?: number | null
          description?: string | null
          id?: number
          name?: string
        }
        Update: {
          abbreviation?: string
          active?: boolean
          category?: number | null
          description?: string | null
          id?: number
          name?: string
        }
        Relationships: [
          {
            foreignKeyName: "public_product_category_fkey"
            columns: ["category"]
            isOneToOne: false
            referencedRelation: "product_category"
            referencedColumns: ["id"]
          },
        ]
      }
      product_category: {
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
      product_component: {
        Row: {
          component: number
          id: number
          main: number
          quantity: number
        }
        Insert: {
          component: number
          id?: number
          main: number
          quantity?: number
        }
        Update: {
          component?: number
          id?: number
          main?: number
          quantity?: number
        }
        Relationships: [
          {
            foreignKeyName: "public_product_component_component_fkey"
            columns: ["component"]
            isOneToOne: false
            referencedRelation: "product"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "public_product_component_main_fkey"
            columns: ["main"]
            isOneToOne: false
            referencedRelation: "product"
            referencedColumns: ["id"]
          },
        ]
      }
      product_image: {
        Row: {
          coverImage: boolean
          description: string | null
          filePath: string
          id: number
          productId: number
          title: string | null
        }
        Insert: {
          coverImage?: boolean
          description?: string | null
          filePath: string
          id?: number
          productId: number
          title?: string | null
        }
        Update: {
          coverImage?: boolean
          description?: string | null
          filePath?: string
          id?: number
          productId?: number
          title?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "public_product_image_productId_fkey"
            columns: ["productId"]
            isOneToOne: false
            referencedRelation: "product"
            referencedColumns: ["id"]
          },
        ]
      }
      product_properties: {
        Row: {
          id: number
          material: string | null
          productId: number
          weight: number | null
          x: number | null
          y: number | null
          z: number | null
        }
        Insert: {
          id?: number
          material?: string | null
          productId: number
          weight?: number | null
          x?: number | null
          y?: number | null
          z?: number | null
        }
        Update: {
          id?: number
          material?: string | null
          productId?: number
          weight?: number | null
          x?: number | null
          y?: number | null
          z?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "public_product_properties_productId_fkey"
            columns: ["productId"]
            isOneToOne: false
            referencedRelation: "product"
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
            referencedRelation: "product"
            referencedColumns: ["id"]
          },
        ]
      }
      product_variant_manufacturer: {
        Row: {
          manufacturer_id: number
          price: number
          product_variant_id: number
        }
        Insert: {
          manufacturer_id: number
          price?: number
          product_variant_id?: number
        }
        Update: {
          manufacturer_id?: number
          price?: number
          product_variant_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "public_product_variant_manufacturer_manufacturer_id_fkey"
            columns: ["manufacturer_id"]
            isOneToOne: false
            referencedRelation: "account"
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
      profile: {
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
          description: string | null
          id: number
          name: string
        }
        Insert: {
          description?: string | null
          id?: number
          name: string
        }
        Update: {
          description?: string | null
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
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  storage: {
    Tables: {
      buckets: {
        Row: {
          allowed_mime_types: string[] | null
          avif_autodetection: boolean | null
          created_at: string | null
          file_size_limit: number | null
          id: string
          name: string
          owner: string | null
          owner_id: string | null
          public: boolean | null
          updated_at: string | null
        }
        Insert: {
          allowed_mime_types?: string[] | null
          avif_autodetection?: boolean | null
          created_at?: string | null
          file_size_limit?: number | null
          id: string
          name: string
          owner?: string | null
          owner_id?: string | null
          public?: boolean | null
          updated_at?: string | null
        }
        Update: {
          allowed_mime_types?: string[] | null
          avif_autodetection?: boolean | null
          created_at?: string | null
          file_size_limit?: number | null
          id?: string
          name?: string
          owner?: string | null
          owner_id?: string | null
          public?: boolean | null
          updated_at?: string | null
        }
        Relationships: []
      }
      migrations: {
        Row: {
          executed_at: string | null
          hash: string
          id: number
          name: string
        }
        Insert: {
          executed_at?: string | null
          hash: string
          id: number
          name: string
        }
        Update: {
          executed_at?: string | null
          hash?: string
          id?: number
          name?: string
        }
        Relationships: []
      }
      objects: {
        Row: {
          bucket_id: string | null
          created_at: string | null
          id: string
          last_accessed_at: string | null
          metadata: Json | null
          name: string | null
          owner: string | null
          owner_id: string | null
          path_tokens: string[] | null
          updated_at: string | null
          version: string | null
        }
        Insert: {
          bucket_id?: string | null
          created_at?: string | null
          id?: string
          last_accessed_at?: string | null
          metadata?: Json | null
          name?: string | null
          owner?: string | null
          owner_id?: string | null
          path_tokens?: string[] | null
          updated_at?: string | null
          version?: string | null
        }
        Update: {
          bucket_id?: string | null
          created_at?: string | null
          id?: string
          last_accessed_at?: string | null
          metadata?: Json | null
          name?: string | null
          owner?: string | null
          owner_id?: string | null
          path_tokens?: string[] | null
          updated_at?: string | null
          version?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "objects_bucketId_fkey"
            columns: ["bucket_id"]
            isOneToOne: false
            referencedRelation: "buckets"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      can_insert_object: {
        Args: {
          bucketid: string
          name: string
          owner: string
          metadata: Json
        }
        Returns: undefined
      }
      extension: {
        Args: {
          name: string
        }
        Returns: string
      }
      filename: {
        Args: {
          name: string
        }
        Returns: string
      }
      foldername: {
        Args: {
          name: string
        }
        Returns: string[]
      }
      get_size_by_bucket: {
        Args: Record<PropertyKey, never>
        Returns: {
          size: number
          bucket_id: string
        }[]
      }
      search: {
        Args: {
          prefix: string
          bucketname: string
          limits?: number
          levels?: number
          offsets?: number
          search?: string
          sortcolumn?: string
          sortorder?: string
        }
        Returns: {
          name: string
          id: string
          updated_at: string
          created_at: string
          last_accessed_at: string
          metadata: Json
        }[]
      }
    }
    Enums: {
      [_ in never]: never
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

