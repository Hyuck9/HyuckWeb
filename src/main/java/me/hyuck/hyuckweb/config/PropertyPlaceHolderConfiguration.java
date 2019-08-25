package me.hyuck.hyuckweb.config;

import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/**
 * 스프링 컨텍스트 영역에서 {@link org.springframework.beans.factory.annotation.Value}
 * 애노테이션을 사용한 프로퍼티 주입 기능을 제공한다.
 * 로딩할 프로퍼티 파일은 설정된 스프링 프로파일(spring.profiles.active)에 따라 결정한다.
 *
 * @author 조신득
 * @see PropertyPlaceholderConfigurer
 * @see Profile
 * @since 1.0
 */
@Slf4j
@Configuration
public class PropertyPlaceHolderConfiguration {

	/**
	 * Spring propertyPlaceholderConfigurer에 대한 Bean
	 * @return				propertyPlaceholderConfigurer 객체
	 * @throws IOException	IO Exception
	 */
	@Bean(name="propertyPlaceholderConfigurer")
	public PropertyPlaceholderConfigurer propertyPlaceholderConfigurer() throws IOException {

		String configExternalized =  Objects.toString(System.getProperty("hw.config.externalized"), "false");

		String configHome = System.getProperty("hw.conf.home");


		PropertyPlaceholderConfigurer propertyPlaceholderConfigurer = new PropertyPlaceholderConfigurer();

		List<Resource> resources = Lists.newArrayList();

		//외부설정
		if(BooleanUtils.isTrue(Boolean.valueOf(configExternalized)))  {
			log.debug("외부설정");
			Preconditions.checkArgument(StringUtils.isNoneBlank(configHome), "외부설정로드를 위한 프로퍼티위치 JVM프로퍼티가 존재하지 않습니다.");

			// 프로퍼티 목록
			resources.addAll(Arrays.asList(new PathMatchingResourcePatternResolver().getResources("file:" + configHome + "/*.properties")));


		} else {
			// 내부설정
			log.debug("내부설정");
			resources.addAll(Arrays.asList(new PathMatchingResourcePatternResolver().getResources("/prop/*.properties")));
		}

		propertyPlaceholderConfigurer.setLocations(resources.toArray(new Resource[0]));

		return propertyPlaceholderConfigurer;
	}
}
