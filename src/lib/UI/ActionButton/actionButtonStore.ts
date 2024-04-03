import type { SvelteComponent } from "svelte"
import { writable } from "svelte/store"

const createStore = () => {
    const {subscribe, set, update} = writable<SvelteComponent[]>()

    return {
        subscribe,
        set, 
        update, 
        add: () => {}
    }
}

export const actionStore = createStore()
