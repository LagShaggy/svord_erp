import { CapacitorConfig } from '@capacitor/cli'

const config: CapacitorConfig = {
	appId: 'oe.studio.ch',
	appName: 'oe-studio',
	webDir: 'build',
	server: {
		androidScheme: 'https'
	}
}

export default config
