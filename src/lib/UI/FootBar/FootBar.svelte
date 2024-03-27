<script lang="ts">
	import Tab from './NavigationTab.svelte'
	import type { TabProps } from './types'

	const products: TabProps = {
		name: 'Products',
		redirect: '/products',
		img: '/icons/package.svg'
	}

	const finance = {
		name: 'Finance',
		redirect: '/finance',
		img: '/icons/dollar-sign.svg'
	}

	const people = {
		name: 'People',
		redirect: '/people',
		img: '/icons/users.svg'
	}

	const information = {
		name: 'Info',
		redirect: '/',
		img: '/icons/eye.svg'
	}
</script>

<div class="fixed bottom-0 mt-auto bg-slate-100 w-full">
	<div class="flex w-full text-center gap-1">
		<Tab props={information} />
		<Tab props={products} />
		<Tab props={people} />
		<Tab props={finance} />
	</div>
</div>
